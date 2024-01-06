# Pandoc Notes

`pandoc --wrap=none -t markdown_strict+pipe_tables+tex_math_dollars+footnotes+task_lists -f` *input format* *input file* `-o` *output file*

Iterate over folder, converting HTML to Markdown and creating toctree:

```bash
printf "%s\n\n%s\n" "# Manual" "\`\`\`{toctree}" > index.md
for html_file in *.html; do
    pandoc --wrap=none -f html -t markdown_strict ${html_file} -o ${html_file}.md
    printf "${html_file}.md\n" >> index.md
done
printf "\`\`\`" >> index.md
```

Without creating toctree:

```bash
for html_file in *.html; do
    pandoc --wrap=none -f html -t markdown_strict ${html_file} -o ${html_file}.md
done
```

man to Markdown:

```bash
for manpage in *.[1-9]; do
    printf -- "-- Processing file: %s\n" ${manpage}
    pandoc --wrap=none -f man -t markdown_strict ${manpage} -o ${manpage}.md
done
```

DocBook to Markdown:

```bash
for docbook in *.docbook; do
    pandoc --wrap=none -f docbook -t markdown_strict ${docbook} -o ${docbook}.md
done
```
