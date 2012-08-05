[![Build Status](https://secure.travis-ci.org/goglog/gog.png?branch=master)](http://travis-ci.org/goglog/gog)

# Gog: The Git Changelog

Gog aims to help developers to insert changelog data inside git commits.
Gog allows to create changelogs based on commit data and tagged commits.

You can find a short presentation here : [Gog lightning talk at Rulu](http://www.youtube.com/watch?v=dD3Ga8b9xTw)
This presentation was made a [Rulu](http://rulu.eu).

## This is still alpha software !
- You can help !
- Better tag managemnt
- Adding a config file to the engine
- just ask by sending a email via github

# Syntax

They are different ways to create changelog entries:

- One line

```
%Bug fix: Fixing issue #2012
```

- One line - one word 

```
%Feature Adding a function to jobs
```

- Long

```
%%Feature: Adding pluck function to ActiveRecord 
pluck is a function allowing users to select only one column
of a given model.
%%
```

# Tags
Gog will rely on version tags:

```
1.0.0
1.0.1
1.1.0
2.0.0
```

# Changelog creation

To show standard changelog run `gog` in a git repository

```
gog
```

