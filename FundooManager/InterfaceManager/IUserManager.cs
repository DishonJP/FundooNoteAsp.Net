using FundooNote.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace FundooManager.InterfaceManager
{
    interface IUserManager
    {
        string CreateUser(AddUser user);
    }
}
