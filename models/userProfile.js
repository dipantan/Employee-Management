module.exports = (sequelize, DataTypes) => {
    const USERPROFILE = sequelize.define("userProfile", {
        userId: {
            type: DataTypes.INTEGER,
            unique: true,
        },
        permanentAddress: {
            type: DataTypes.STRING,
        },
        city: {
            type: DataTypes.STRING,
        },
        state: {
            type: DataTypes.STRING,
        },
        country: {
            type: DataTypes.STRING,
        },
        emergencyPhone: {
            type: DataTypes.STRING,
        },
    });
    return USERPROFILE;
};
