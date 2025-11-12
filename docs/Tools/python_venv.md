# Python


## Virtual envionments
Module `venv` creates virtual environments that are isolated python installations with their own python interpreter, packages, environment variables.
```bash
my_project/
├── venv/           # Virtual environment directory
│   ├── Include/
│   ├── bin/        # (Linux) or Scripts/ (Windows)
│   ├── lib/        # Python packages
│   └── pyvenv.cfg  # Configuration
└── requirements.txt
```
`venv/` should be added to `.gitignore`, recreate venv at every new install.  
File `requirements.txt` is used to recreate the venv with its packages,
```txt
# requirements.txt
mkdocs-material>=9.7.0
matplotlib>=3.5.0
```
Create, activate, install dependencies as
```bash
# Create virtual env
python -m venv path_to_myproject/venv/

# Activate/deactivate
venv\Scripts\activate    # Windows
source venv/bin/activate # Linux
deactivate               # both

# Install dependencies
pip install -r requirements.txt  # use when venv is active
```


If venv is not active but python scripts has the following header line, it is still executed using venv
```python
#!/<path-to-venv>/bin/python
# or for Windows
#!/<path-to-venv>/Scripts/python
```
