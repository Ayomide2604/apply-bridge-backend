migrate(
	async ({ db }) => {
		const email = process.env.ADMIN_EMAIL;
		const password = process.env.ADMIN_PASSWORD;

		if (!email || !password) {
			console.log("Admin credentials not set in env.");
			return;
		}

		const admin = await db.admins.getOneByEmail(email).catch(() => null);
		if (!admin) {
			await db.admins.create({
				email,
				password,
				passwordConfirm: password,
			});
		}
	},
	async () => {}
);
