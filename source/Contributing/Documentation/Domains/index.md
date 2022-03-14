# Sphinx Domains

```{toctree}
---
titlesonly: true
---
SCDT-API.rst
```

The GNUstep Documentation project includes a number of domains (which are currently incomplete), based on [`sphinxcontrib.domaintools`](https://github.com/sphinx-contrib/domaintools).

## Make domain

This domain is the example for `sphinxcontrib.domaintools`.

````{rst:directive} .. make:var:: VARIABLE_NAME
A variable.

```make
VARIABLE_NAME = variable_value
```
````

````{rst:directive} .. make:target:: target_name
A target.

```make
target_name:
    ...
```
````

## Resources

* `sphinxcontrib.domaintools`:
    * [Very short tutorial](https://samprocter.com/2014/06/documenting-a-language-using-a-custom-sphinx-domain-and-pygments-lexer/)
    * [`sphinx.util.docfields`](https://github.com/sphinx-doc/sphinx/blob/4.x/sphinx/util/docfields.py)
    * Examples:
        * [CMake domain](https://github.com/sphinx-contrib/cmakedomain/blob/master/sphinxcontrib/cmakedomain.py)
        * [GNU Make domain](https://github.com/sphinx-contrib/makedomain/blob/master/sphinxcontrib/makedomain.py)
* Using the Sphinx API directly:
    * [Opensource.com tutorial](https://opensource.com/article/18/11/building-custom-workflows-sphinx)
    * [Default domains source code](https://github.com/sphinx-doc/sphinx/tree/4.x/sphinx/domains)
    * [Domain API](https://www.sphinx-doc.org/en/master/extdev/domainapi.html)
