using System;
using System.Collections.Generic;
using System.Text;

namespace EntityLayer.EventosDeportivosEx1
{

    public class User
    {
        public User()
        {
        }
        public User(int id, string username, string password, string email, string birthday, int userType)
        {
            ID = id;
            UserName = username;
            Password = password;
            Email = email;
            Birthday = birthday;
            UserType = userType;
        }
        public int ID { get; set; }
        public string UserName { get; set; }
        public string Password { get; set; }
        public string Email { get; set; }
        public string Birthday { get; set; }
        public int UserType { get; set; }
    }




}
