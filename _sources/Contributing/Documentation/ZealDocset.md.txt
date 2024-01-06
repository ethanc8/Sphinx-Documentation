# Zeal Docsets

## Installing doc2dash

The doc2dash author recommends installing via pipx:

```bash
python3 -m pip install --user pipx
python3 -m pipx ensurepath
pipx install doc2dash
```

## Usage

```
doc2dash build/html -d build/dash -n GNUstepBase
cp -r build/dash/GNUstepBase.docset /home/pi/.local/share/Zeal/Zeal/docsets
```