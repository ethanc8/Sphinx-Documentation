# Intersphinx

The GNUstep documentation project will use Intersphinx to replace the current dysfunctional `<a href="../../RawHtml/...">`. In order to do this, a custom object inventory will be created.

In order to link to a page without API documentation, you need to manually add a target using the `.. _` *target name* `:` syntax -- see the [StackOverflow question](https://stackoverflow.com/questions/45699577/how-to-link-to-root-page-in-intersphinx).

## Todo

* [ ] Script that automatically converts `igsdoc` to `objects.inv`

## References

### Intersphinx

* [Official documentation](https://www.sphinx-doc.org/en/master/usage/extensions/intersphinx.html)
* [Using intersphinx to create multiple docsets that are part of the same docset](http://www.brokenlyre.com/blog/2018/08/05/sphinx-submodules/)
* [ReadTheDocs tutorial](https://docs.readthedocs.io/en/stable/guides/intersphinx.html)
* [Pycharm Sphinx tutorial](https://www.jetbrains.com/pycharm/guide/tutorials/sphinx_sites/intersphinx/)

Random projects have information about Intersphinx in their documentation:

* [Releng docs](https://docs.releng.linuxfoundation.org/en/latest/project-documentation.html#intersphinx-linking)
* [Ambition Docs Guide](https://ambition-docs-guide.readthedocs.io/en/latest/ref/intersphinx.html)
* [Netoptimcpp documetation](https://netoptimcpp.readthedocs.io/en/latest/using_intersphinx.html)
* [Exhale example](https://my-favorite-documentation-test.readthedocs.io/en/latest/using_intersphinx.html)

### Custom object inventory

* [Creating a Custom Intersphinx Mapping for BeautifulSoup](https://github.com/svenevs/exhale/tree/master/docs/_intersphinx)
* [`sphobjinv` tutorial](https://sphobjinv.readthedocs.io/en/stable/customfile.html)
* [Example (potentially outdated)](https://github.com/bskinn/intersphinx-xlwsf)