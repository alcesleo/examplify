require 'rake/file_list'

module Examplify
  class FileList
    attr_reader :files

    def initialize(paths)
      @files = Rake::FileList[get_list_of_files(paths)]
    end

    def exclude(glob)
      return if glob.nil?
      files.exclude do |file|
        filename = file.pathmap("%n")
        File.fnmatch(glob, filename, File::FNM_DOTMATCH)
      end
    end

    def output
      files.map { |file| "# #{file}\n#{File.read(file)}" }.join("\n")
    end

    private

    # given a path or a list of paths to folders or files
    # returns an array of paths to all files given, and
    # all files contained in subdirectories of folders,
    # but without the folders
    def get_list_of_files(paths)
      paths = Array(paths)

      paths.flat_map do |path|
        if File.directory? path
          get_all_files_inside(path)
        else
          [path]
        end
      end
    end

    def get_all_files_inside(folder)
      # get paths of files recursively, ignoring paths to folders
      Dir.glob(File.join(folder, '**/*')).reject { |path| File.directory? path }
    end
  end
end
