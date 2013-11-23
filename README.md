###srt to json api

An over-engineered solution to a cross origin resource problem.
Given a link to an srt file, returns a json object.

```
{ "start_time" => start_time ,
  "end_time"   => end_time ,
  "text"       => text 
}
```

Available on heroku, simply provide your url as an arguement:

```
http://srt2json.herokuapp.com/?url=INSERT_YOUR_URL.srt
```