(function() {
	return {
		librato: {
			email:  process.env.LIBRATO_EMAIL,
			token:  process.env.LIBRATO_TOKEN,
			source: "megocorp"
		}
		, backends: ["statsd-librato-backend"]
		, port: 8125
	};
})()
