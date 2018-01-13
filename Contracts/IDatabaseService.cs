﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Codewars_Bot.Contracts
{
	public interface IDatabaseService
	{
		void AuditMessageInDatabase(string message);
		string GetWeeklyRating();
		string GetTotalRating();
		string SaveUserToDatabase(UserModel user);
		UserModel GetUserById(int id);
	}
}