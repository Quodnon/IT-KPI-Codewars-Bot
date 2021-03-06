﻿using System;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;
using Microsoft.Bot.Connector;
using Codewars_Bot.Contracts;

namespace Codewars_Bot
{
	[BotAuthentication]
	public class MessagesController : ApiController
	{
		private IMessageService MessageService { get; set; }
		private IDatabaseService DatabaseService { get; set; }

		public MessagesController(IMessageService messageService, IDatabaseService databaseService)
		{
			MessageService = messageService;
			DatabaseService = databaseService;
		}

		public async Task<HttpResponseMessage> Post([FromBody]Activity activity)
		{

			if (activity.Type == ActivityTypes.Message)
			{
				ConnectorClient connector = new ConnectorClient(new Uri(activity.ServiceUrl));

				var responseMessages = await MessageService.ProcessMessage(activity);

				try
				{
					if (responseMessages.Count != 0)
					{
						foreach (var message in responseMessages) { 
							Activity reply = activity.CreateReply($"{message}");
							reply.ReplyToId = new Guid().ToString();
							connector.Conversations.ReplyToActivity(reply);
						}
					}
				}
				catch (Exception ex)
				{
					DatabaseService.AuditMessageInDatabase($"EXCEPTION: {ex.Message} {ex.StackTrace}");
				}
			}
			else
			{
				HandleSystemMessage(activity);
			}

			var response = Request.CreateResponse(HttpStatusCode.OK);
			return response;
		}

		private Activity HandleSystemMessage(Activity message)
		{
			if (message.Type == ActivityTypes.DeleteUserData)
			{
				// Implement user deletion here
				// If we handle user deletion, return a real message
			}
			else if (message.Type == ActivityTypes.ConversationUpdate)
			{
				// Handle conversation state changes, like members being added and removed
				// Use Activity.MembersAdded and Activity.MembersRemoved and Activity.Action for info
				// Not available in all channels
			}
			else if (message.Type == ActivityTypes.ContactRelationUpdate)
			{
				// Handle add/remove from contact lists
				// Activity.From + Activity.Action represent what happened
			}
			else if (message.Type == ActivityTypes.Typing)
			{
				// Handle knowing tha the user is typing
			}
			else if (message.Type == ActivityTypes.Ping)
			{
			}

			return null;
		}
	}
}