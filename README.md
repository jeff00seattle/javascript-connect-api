# javascript-connect-api
#### Learn what an API is and how to connect to an API with plain JavaScript by creating a simple web app.


## Introduction

A big part of working with JavaScript is knowing how to connect to APIs. As a fledgling 
developer, you may have been told at some point to just “play around with some APIs!” 
to learn what they are and how to work with them. If you’ve ever taken a look at the 
documentation for an API and had no idea where to start or what to do and gotten 
frustrated, this is the article for you.

We’re going to make a very simple web app with plain JavaScript that will 
retrieve information from an API and display it on the page. There will be 
no server, dependencies, build tools, or anything else to further muddy the 
waters on an already difficult and confusing topic for beginners.

## Prerequisites
* Basic knowledge of [HTML and CSS](https://internetingishard.com/html-and-css/).
* Basic knowledge of [JavaScript syntax and datatypes](https://www.sitepoint.com/beginners-guide-javascript-variables-and-datatypes/).
* Basic knowledge of working with [JSON and JavaScript objects](https://www.taniarascia.com/how-to-use-json-data-with-php-or-javascript/). This brief article will clear it up completely.

Everything else we’ll cover along the way.

## Goals
We are going to write from scratch 
[this simple web app](https://taniarascia.github.io/sandbox/ghibli/) that connects to a 
[Studio Ghibli API](https://ghibliapi.herokuapp.com/), retrieves the data with 
JavaScript, and displays it on the front end of a website. This is not meant to 
be an extensive resource on APIs or REST – just the simplest possible example to 
get up and running that you can build from in the future. We’ll learn:

* What a Web API is.
* Learn how to use the HTTP request GET with JavaScript
* How create and display HTML elements with JavaScript.

It will look like this:

Let’s get started.

## Quick overview
API stands for Application Program Interface, which can be defined as a set of 
methods of communication between various software components. In other words, 
an API allows software to communicate with another software.

We’ll be focusing specifically on Web APIs, which allow a web server to interact 
with third-party software. In this case, the web server is using HTTP requests to 
communicate to a publicly available URL endpoint containing JSON data. If this is 
confusing now, it will make sense by the end of the article.

You may be familiar with the concept of a CRUD app, which stands for 
Create, Read, Update, Delete. Any programming language can be used to make 
a CRUD app with various methods. A web API uses HTTP requests that 
correspond to the CRUD verbs.

| Action    | HTTP Method   | Definition                   | 
|-----------|---------------|------------------------------|
| Create	| POST          | Creates a new resource       | 
| Read	    | GET           | Retrieves a resource         | 
| Update	| PUT/PATCH     | Updates an existing resource | 
| Delete	| DELETE        | Deletes a resource           | 

## REST

If you’ve heard REST and RESTful APIs, that is simply referring to a set of 
standards that conform to a specific architectural style. Most web apps do, 
or aim to conform to REST standards. Overall, there are a lot of terms, 
acronyms and concepts to understand – HTTP, API, REST – so it’s normal 
to feel confused and frustrated, especially when API documentation assumes 
you already know what to do.


## Setting Up

What is our objective? We want to get the data for 
all Studio Ghibli films and display the titles and descriptions in a grid. 
For some background knowledge, Studio Ghibli is a Japanese animation studio 
that produced several films, such as Spirited Away.

We’re going to start by creating an ```index.html``` file in a new directory. 
The project will only consist of ```index.html```, ```style.css```, and ```scripts.js``` 
at the end. This HTML skeleton just links to a CSS and JavaScript file, loads in a font, 
and contains a div with a root id. This file is complete and will not change. 
We’ll be using JavaScript to add everything from here out.

```html
<!doctype html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <title>Ghibli App</title>
  
  <link href="https://fonts.googleapis.com/css?family=Dosis:400,700" rel="stylesheet">
  <link href="style.css" rel="stylesheet">

</head>

<body>

  <div id="root"></div>

  <script src="scripts.js"></script>
</body>
</html>
```

A style.css that will be used to create a grid.

```css
#root {
  max-width: 1200px;
  margin: 0 auto;
}

.container {
  display: flex;
  flex-wrap: wrap;
}

.card {
  margin: 1rem;
  border: 1px solid gray;
}

@media screen and (min-width: 600px) {
  .card {
    flex: 1 1 calc(50% - 2rem);
  }
}

@media screen and (min-width: 900px) {
  .card {
    flex: 1 1 calc(33% - 2rem);
  }
}
```
