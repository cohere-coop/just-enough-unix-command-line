files = ["en-US/title.txt"] + Dir.glob("en-US/**/*.md")

`pandoc --toc -S -o output/just-enough-command-line-en-us.epub #{files.join(" ")}`
