API_DATA = {
	directory: {
		contact_url: "http://api.codeislike.com/contact",
		status_url: "http://api.codeislike.com/status",
		twitter_status_url: "http://api.codeislike.com/status/twitter"
	},
	contact: {
		first_name: "Nathan",
		middle_name: "Lawrence",
		last_name: "Allen",
		job_title: "Junior Web Developer",
		github_url: "https://github.com/nathanallen",
		blog_url: "http://codeislike.com/",
		linkedin_url: "http://www.linkedin.com/in/thisisnathan",
		twitter_url: "https://twitter.com/punriddled",
		email: "first_name + middle_name + last_name + '@gmail.com'"
	},
	status: {
		awake: (Time.now.hour > 8 && Time.now.hour < 23),
		job_status: "Actively looking",
		twitter: Twitter.user_timeline("punriddled", count: 1).first[:text]
	},
}