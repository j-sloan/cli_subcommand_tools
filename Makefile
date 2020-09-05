.PHONEY: dev reformat lint clean dist

dev: venv

reformat: venv
	./venv/bin/black -l120 python

lint: venv
	./venv/bin/black -l120 --check python
	./venv/bin/flake8 --max-line-length=120 python

clean:
	rm -rf venv/
	rm -rf python/{build,dist,*.egg-info}

dist: venv
	rm -r python/dist
	cd python && ../venv/bin/python setup.py bdist_wheel
	./venv/bin/python -m twine check python/dist/*

venv: requirements.txt
	python3 -m venv --clear venv
	./venv/bin/pip install -Ur requirements.txt
	./venv/bin/pip install -e python
