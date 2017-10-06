#!/usr/local/bin/python
# -*- coding: utf-8 -*-
import os
from dotenv import load_dotenv

# try:
#     load_dotenv('.env')
# except ImportError as err:
#     mesag = "%s\nLibreria dotenv!\nUse pip install - U python - dotenv\n %s"
#     print(mesag % (40 * '==', 40 * '=='))
#     sys.exit(1)

if __name__ == '__main__':
    print os.path.dirname(os.path.abspath(__file__))
