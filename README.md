# Examplify

Examplify squashes multiple files together into one for easily pasting into a
gist or a markdown document. It puts comments/headers with the filenames.

## Example output

```
# /root/file.rb
contents of file.rb

# /root/another_file.rb
contents of another_file.rb
```

## Usage

```bash
# entire folder
examplify project/

# only ruby files
examplify project/ --only=rb

# without some files
examplify project/ --exclude=.rb


# choose specific files
examplify file.rb file2.rb

# markdownish output
examplify project/ --file-prefix="## " --line-prefix="    "

# more advanced markdown
examplify project/ --only=rb --file-prefix="## " --before-file="```ruby" --after-file="```"
```
