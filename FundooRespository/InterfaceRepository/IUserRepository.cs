using FundooNote.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace FundooRespository.InterfaceRepository
{
    interface IUserRepository
    {
        bool AddUser(AddUser user);
    }
}
