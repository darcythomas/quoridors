﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using Quoridors.Models.Database.Interfaces;
using Quoridors.Models.DatabaseModels;

namespace Quoridors.Models.Database
{
    public class GameRepository : Repository<GameDb>, IGameRepository
    {
        public override GameDb NewModel(SqlDataReader reader)
        {
            return new GameDb();
        }

        public int CreateGame()
        {
            ExecuteStoredProcedure("CreateGame", new GameDb(), new SqlParameter[]{});
            return GetLastId();
        }

        public GameDb GetById(int gameId)
        {
            throw new NotImplementedException("add this method to interfaces and such");
        }

        public override IEnumerable<GameDb> All()
        {
            return ExecuteReadStoredProcedure("GetAllGame", new SqlParameter[]{});
        }
    }
}