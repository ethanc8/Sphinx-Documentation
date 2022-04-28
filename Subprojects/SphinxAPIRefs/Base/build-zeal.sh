ZEAL_DOC_NAME=GNUstepBase
rm -r build/dash/${ZEAL_DOC_NAME}.docset
doc2dash build/html -d build/dash -n ${ZEAL_DOC_NAME}
cp -r build/dash/${ZEAL_DOC_NAME}.docset ${HOME}/.local/share/Zeal/Zeal/docsets