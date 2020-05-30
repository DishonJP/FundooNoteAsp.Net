namespace FundooWebforms.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class changeguidtoint : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.NoteModels",
                c => new
                    {
                        NoteId = c.Int(nullable: false, identity: true),
                        Title = c.String(nullable: false),
                        Description = c.String(),
                        UserId = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.NoteId)
                .ForeignKey("dbo.UserModels", t => t.UserId, cascadeDelete: true)
                .Index(t => t.UserId);
            
            CreateTable(
                "dbo.UserModels",
                c => new
                    {
                        UserId = c.Int(nullable: false, identity: true),
                        FirstName = c.String(nullable: false),
                        LastName = c.String(nullable: false),
                        Email = c.String(nullable: false),
                        Password = c.String(nullable: false),
                    })
                .PrimaryKey(t => t.UserId);
            
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.NoteModels", "UserId", "dbo.UserModels");
            DropIndex("dbo.NoteModels", new[] { "UserId" });
            DropTable("dbo.UserModels");
            DropTable("dbo.NoteModels");
        }
    }
}
