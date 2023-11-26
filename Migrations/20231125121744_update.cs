using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace BEARLINGO.Migrations
{
    /// <inheritdoc />
    public partial class update : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "CorrectR",
                table: "KetQuaR");

            migrationBuilder.DropColumn(
                name: "CorrectL",
                table: "KetQuaL");

            migrationBuilder.AddColumn<bool>(
                name: "IsCorrectR",
                table: "KetQuaR",
                type: "bit",
                nullable: false,
                defaultValue: false);

            migrationBuilder.AddColumn<bool>(
                name: "IsCorrectL",
                table: "KetQuaL",
                type: "bit",
                nullable: false,
                defaultValue: false);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "IsCorrectR",
                table: "KetQuaR");

            migrationBuilder.DropColumn(
                name: "IsCorrectL",
                table: "KetQuaL");

            migrationBuilder.AddColumn<string>(
                name: "CorrectR",
                table: "KetQuaR",
                type: "nvarchar(50)",
                maxLength: 50,
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "CorrectL",
                table: "KetQuaL",
                type: "nvarchar(50)",
                maxLength: 50,
                nullable: true);
        }
    }
}
