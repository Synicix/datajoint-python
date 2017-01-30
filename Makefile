all:
	@echo 'MakeFile for DataJoint packaging                                              '
	@echo '                                                                              '
	@echo 'make sdist                              Creates source distribution           '
	@echo 'make wheel                              Creates Wheel distribution            '
	@echo 'make pypi                               Package and upload to PyPI            '
	@echo 'make pypitest                           Package and upload to PyPI test server'
	@echo 'make purge                              Remove all build related directories  '
	

sdist:
	python3 setup.py sdist >/dev/null 2>&1

wheel:
	python3 setup.py bdist_wheel >/dev/null 2>&1

pypi:purge sdist wheel
	twine upload dist/*
	
pypitest: purge sdist wheel
	twine upload -r pypitest dist/*

purge:
	rm -rf dist && rm -rf build && rm -rf *.egg-info




