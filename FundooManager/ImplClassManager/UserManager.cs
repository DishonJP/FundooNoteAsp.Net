using FundooManager.InterfaceManager;
using FundooNote.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace FundooManager.ImplClassManager
{
    class UserManager:IUserManager
    {
        private readonly IUserManager _respository;

        public UserManager(IUserManager respository)
        {
            this._respository = respository;
        }
        public string CreateUser(AddUser user)
        {
            return this._respository.CreateUser(user);
        }
    }
}
