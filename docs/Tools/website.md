# Website
## Create the site
Following [mkdocs-material](https://squidfunk.github.io/mkdocs-material/creating-your-site/),

- Install mkdocs-material (preferably in a python virtual environment)
- `mkdocs new .` to create a blank site
- change `mkdocs.yml` to (minimal example for content with code and equations)
```yaml
site_name: engineering_notes
site_url: https://julesmatz.github.io/

nav:
  - Home: index.md
  - Website: website.md

theme:
  name: material

plugins:
  - search

markdown_extensions:
  - pymdownx.highlight:
      anchor_linenums: true
      line_spans: __span
      pygments_lang_class: true
  - pymdownx.inlinehilite
  - pymdownx.snippets
  - pymdownx.superfences
  - pymdownx.arithmatex:
      generic: true

extra_javascript:
  - https://unpkg.com/mathjax@3/es5/tex-mml-chtml.js
```

## Update the site
- Add new pages in folder `docs`, e.g. `website.md` in `docs/tools`
- Reference them in `mkdocs.yml`, e.g.
```yaml
nav:
  - Home: index.md
  - Website: tools/website.md
```
- Build using `mkdocs serve --livereload` for automatic site reload upon modifications.

## Publish the site
To publish the site as a github page
```
mkdocs gh-deploy --force
```
And in GitHub, in the repository options, in the Pages tab, select Branch : gh-deploy (and save it)


## Access the site
at [https://julesmatz.github.io/](https://julesmatz.github.io/)
