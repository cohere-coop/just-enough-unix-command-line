chapter_name_order = ["introduction",
                      "the-file-system",
                      "command-line-basics-part-two",
                      "finding-and-grepping",
                      "redirection-and-pipes",
                      "scripting",
                      "system-profiler-and-top",
                      "ssh",
                      "irb-and-bash",
                      "curl",
                      "path",
                      "linking",
                      "sed-and-awk",
                      "xargs-and-cut",
                      "tips-and-tricks-part-one",
                      "tips-and-tricks-part-two",
                      "summary"]

chapters = []

chapter_name_order.each do |chapter_name|
  chapters << "en-US/src/#{chapter_name}.md"
end

files = ["en-US/title.txt"] + ["en-US/01-errata.md"] + chapters

`pandoc --toc -S --template=en-US/template.html -o output/just-enough-command-line-en-us.epub #{files.join(" ")}`
