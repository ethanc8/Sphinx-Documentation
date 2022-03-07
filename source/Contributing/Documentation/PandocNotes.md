# Pandoc Notes

`pandoc --wrap=none -f` *input format* `-t markdown_strict` *input file* `-o` *output file*

Iterate over folder, converting HTML to Markdown:

```bash
printf "%s\n\n%s\n" "# Manual" "\`\`\`toctree" > index.md
for html_file in *.html; do
    pandoc --wrap=none -f html -t markdown_strict ${html_file} -o ${html_file}.md
    printf "${html_file}.md\n" >> index.md
done
printf "\`\`\`" >> index.md
```