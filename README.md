[![CircleCI](https://circleci.com/gh/nhim175/coders-tokyo-web.svg?style=svg)](https://circleci.com/gh/nhim175/coders-tokyo-web)

# CodersX Website

Made with [Hexo.js](https://hexo.io/)

# Requirements

- Install Node (prefer using [nvm](https://github.com/creationix/nvm))
- Install [Hexo CLI](https://github.com/hexojs/hexo)
- Install [Firebase CLI](https://firebase.google.com/docs/cli/)

# Development

```
$ nvm use     # use the node version defined in .nvmrc
$ npm install
$ hexo server # start dev server
```

# Hexo CLI commands

```
$ hexo new post "Post title here"
$ hexo new page "Page title here"
```

# Deployment

```
$ hexo generate    # build html files
$ firebase deploy  # deploy to Firebase
```

Note: you may need to run `firebase login` for the first time using Firebase CLI

# Contribute

- Checkout a branch from `master` with name:
  - If it's a new post: `post/title-of-the-post`
  - If it's a page: `page/title-of-the-page`
  - If it's a feature: `feature/some-feature`
  - If it's a bug fix: `fix/issue-<number>`
- Push branch and create a Pull-request
- Wait for approval and merge/deploy

# TODO

- Integrate CI/CD
