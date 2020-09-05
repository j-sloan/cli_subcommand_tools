releasing
=========

To make a new release:

1. bump version
1. run `make dist`
1. note the path to the artefact
1. upload via `./venv/bin/python -m twine upload -u j-sloan ${DIST}`
