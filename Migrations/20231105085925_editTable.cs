using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace BEARLINGO.Migrations
{
    /// <inheritdoc />
    public partial class editTable : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {

            migrationBuilder.DropColumn(
                name: "Diem",
                table: "KetQuaR");

            migrationBuilder.DropColumn(
                name: "NgayThi",
                table: "KetQuaR");

            migrationBuilder.DropColumn(
                name: "SoCauDung",
                table: "KetQuaR");

            migrationBuilder.DropColumn(
                name: "SoCauSai",
                table: "KetQuaR");

            migrationBuilder.DropColumn(
                name: "ThoiGian",
                table: "KetQuaR");

            migrationBuilder.DropColumn(
                name: "Diem",
                table: "KetQuaL");

            migrationBuilder.DropColumn(
                name: "NgayThi",
                table: "KetQuaL");

            migrationBuilder.DropColumn(
                name: "SoCauDung",
                table: "KetQuaL");

            migrationBuilder.DropColumn(
                name: "SoCauSai",
                table: "KetQuaL");

            migrationBuilder.DropColumn(
                name: "ThoiGian",
                table: "KetQuaL");

            migrationBuilder.DropColumn(
                name: "NoiDungDeThi",
                table: "DeThi");

            migrationBuilder.AddColumn<int>(
                name: "DiemL",
                table: "BaiLam",
                type: "int",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "DiemR",
                table: "BaiLam",
                type: "int",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "SoCauDungL",
                table: "BaiLam",
                type: "int",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "SoCauDungR",
                table: "BaiLam",
                type: "int",
                nullable: true);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "DiemL",
                table: "BaiLam");

            migrationBuilder.DropColumn(
                name: "DiemR",
                table: "BaiLam");

            migrationBuilder.DropColumn(
                name: "SoCauDungL",
                table: "BaiLam");

            migrationBuilder.DropColumn(
                name: "SoCauDungR",
                table: "BaiLam");

            migrationBuilder.AddColumn<int>(
                name: "IDDangNhap",
                table: "NguoiDung",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<double>(
                name: "Diem",
                table: "KetQuaR",
                type: "float",
                nullable: true);

            migrationBuilder.AddColumn<DateTime>(
                name: "NgayThi",
                table: "KetQuaR",
                type: "date",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "SoCauDung",
                table: "KetQuaR",
                type: "int",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "SoCauSai",
                table: "KetQuaR",
                type: "int",
                nullable: true);

            migrationBuilder.AddColumn<TimeSpan>(
                name: "ThoiGian",
                table: "KetQuaR",
                type: "time",
                nullable: true);

            migrationBuilder.AddColumn<double>(
                name: "Diem",
                table: "KetQuaL",
                type: "float",
                nullable: true);

            migrationBuilder.AddColumn<DateTime>(
                name: "NgayThi",
                table: "KetQuaL",
                type: "date",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "SoCauDung",
                table: "KetQuaL",
                type: "int",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "SoCauSai",
                table: "KetQuaL",
                type: "int",
                nullable: true);

            migrationBuilder.AddColumn<TimeSpan>(
                name: "ThoiGian",
                table: "KetQuaL",
                type: "time",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "NoiDungDeThi",
                table: "DeThi",
                type: "nvarchar(max)",
                nullable: true);
        }
    }
}
