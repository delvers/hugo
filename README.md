# Hugo container
To run always the latest hugo version you can use this container just mount your directory to `/site` in the container.
```
alias hugo="docker run -v ./:/site delvers/hugo"
hugo version
```
