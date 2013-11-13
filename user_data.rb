USER_DATA = {
	contact: {
		first_name: "Nathan",
		middle_name: "Lawrence",
		last_name: "Allen",
		job_title: "Junior Web Developer",
		github: "https://github.com/nathanallen",
		blog: "http://codeislike.com/",
		linkedin: "http://www.linkedin.com/in/thisisnathan",
		twitter: "https://twitter.com/punriddled",
		email: "first_name + middle_name + last_name + '@gmail.com'",
	},
	status: {
		awake: (Time.now.hour > 8 && Time.now.hour < 23),
		job_status: "Actively looking",
		last_tweet: Twitter.user_timeline("punriddled", count: 1).first[:text],
	},
}