# GitBook Publishing

Automatically convert markdown files into GitBook static site and publish it on GitHub pages.


## Usage

The action will be set up with the following simple steps.

1. Add a workflow in your repo as the below template.

```yml
name: 'gitbook-publish'
on:
  push:
    branches:
      - master
jobs:
  build-and-publish:
    runs-on: ubuntu-latest
    env:
      USER_NAME : <your_git_username>
      USER_EMAIL: <your_git_user_email>
    steps:
      - uses: actions/checkout@v3
      - uses: actions/setup-node@v3
        with:
          node-version: '10.22.0'
      - run: 
          npm install gitbook-cli -g
      - run:
          gitbook init
      - run:
          gitbook install ./book
      - run:
          gitbook build ./book --output=. ./docs
      - name: Build
        uses: bob1113/gitbook-publish@v1.0.0
```

2. Name the folder contains your markdown files as `book` and place it in the root directory. The repo structure may be like the following example.

```
.
├── .github
│   └── workflows
│       └── build.yml
├── book
    ├── README.md
    ├── SUMMARY.md
    ├── book.json
    ├── chapter1
    │   ├── chapter1.md
    │   ├── section1.md
    │   └── section2.md
    └── chapter2
        ├── chapter2.md
        ├── section1.md
        └── section2.md
```

3. Customize the `book.json` file and `SUMMARY.md` file, the former is for GitBook style customization, and the later is for table of contents of the whole GitBook site.

4. Push your local repo to GitHub and wait for a while.
   
5. In the `Setting` page of your repo, choose the option to deploy GitHub pages from the `docs` folder of branch `gh-pages`.

6. Link to the website `https://<GitHub_username>.github.io/<repo_name>/`, which is the site that your repository to be published on.


## License

The scripts and documentation in this project are released under the [MIT License](LICENSE)


## Contributions

Contributions are welcome!