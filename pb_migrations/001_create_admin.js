migrate(
	async ({ db }) => {
		const email = process.env.ADMIN_EMAIL;
		const password = process.env.ADMIN_PASSWORD;

		if (!email || !password) {
			console.log("Admin credentials not set in environment.");
			return;
		}

		try {
			// Check if admin already exists
			await db.admins.getOneByEmail(email);
			console.log("Admin already exists:", email);
		} catch {
			// If not found, create a new admin
			await db.admins.create({
				email,
				password,
				passwordConfirm: password,
			});
			console.log("Admin created:", email);
		}
	},

	async () => {
		// Optional rollback (leave empty or delete if not needed)
	}
);
