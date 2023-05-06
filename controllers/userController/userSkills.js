const db = require('../../models');
const getUserSkillsData = require('../fetchData/userSkills');
const currentUser = require('../fetchData/currentUser');

exports.getUserSkills = async (req, res) => {
	try {
		const currentUserEmail = req.user.userEmail;
		const userSkillsData = await getUserSkillsData.fetchSkills(currentUserEmail);
		if (userSkillsData.length == 0) {
			return res.status(404).json({ message: 'No user skills found' });
		} else {
			return res.status(200).json({ data: userSkillsData });
		}
	} catch (error) {
		console.log(error);
		return res.status(500).json({ message: 'Internal Server Error' });
	}
};

exports.updateUserSkills = async (req, res) => {
	try {
		const request = req.body;
		const currentUserEmail = req.user.userEmail;
		const userId = await currentUser(currentUserEmail);
		const data = await db.sequelize.query(
			'EXEC dbo.spusers_updateuserskills :userId, :primarySkills, :secondarySkills, :certifications',
			{
				replacements: {
					userId: userId,
					primarySkills: request.primarySkills,
					secondarySkills: request.secondarySkills,
					certifications: request.certifications
				}
			}
		);
		if (data[1] != 0) {
			return res.status(201).json({ message: 'User skills updated successfully' });
		} else {
			return res.status(400).json({ message: 'User skills updation failed' });
		}
	} catch (error) {
		console.log(error);
		return res.status(500).json({ message: 'Internal Server Error' });
	}
};
