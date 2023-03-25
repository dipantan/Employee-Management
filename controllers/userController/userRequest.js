const db = require("../../models");
const User = db.user;
const UserRequest = db.userRequest;
const getUserRequestData = require("../fetchData/userRequest");
const currentUser = require('../fetchData/currentUser');

exports.postUserRequest = async (req, res) => {
  try {
    const response = req.body;
    const currentUserEmail = req.user.userEmail;
    const userId = await currentUser(currentUserEmail);
    response.userId = userId;
    const userRequest = await UserRequest.create(response);
    return res.status(201).json(userRequest);
  } catch (error) {
    console.log(error);
  }
};

exports.getUserRequests = async (req, res) => {
  try {
    const currentUserEmail = req.user.userEmail;
    const userRequestData = await getUserRequestData.fetchRequest(
      currentUserEmail
    );
    if (userRequestData == null) {
      return res.status(404).json({ message: "no data found" });
    } else {
      return res.status(200).json({ data: userRequestData });
    }
  } catch (error) {
    return res.status(404).json({ message: "No data available" });
  }
};