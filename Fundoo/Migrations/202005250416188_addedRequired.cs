namespace FundooNote.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class addedRequired : DbMigration
    {
        public override void Up()
        {
            AlterColumn("dbo.AddNotes", "Title", c => c.String(nullable: false));
            AlterColumn("dbo.AddNotes", "Description", c => c.String(nullable: false));
        }
        
        public override void Down()
        {
            AlterColumn("dbo.AddNotes", "Description", c => c.String());
            AlterColumn("dbo.AddNotes", "Title", c => c.String());
        }
    }
}
