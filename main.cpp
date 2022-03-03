#include <iostream>
#include "mysql.h"
#include <OpenXLSX.hpp>
#include <string>
#include <vector>
#include <map>

MYSQL* conn = mysql_init(0);

int main() {
    conn = mysql_real_connect(conn, "localhost", "root", "", "pasien", 3306, NULL, 0);

    std::cout << "LAPORAN PASIEN CORONA VIRUS" << std::endl;
    std::cout << "==========================================================" << std::endl;
    std::cout << "1. Laporan Pasien Berdasarkan Daerah" << std::endl;
    std::cout << "2. Laporan Pasien Berdasarkan Tanggal" << std::endl;
    int pilihan;
    std::cout << "Pilih : ";
    std::cin >> pilihan;
    if (pilihan == 2) {
        // ambil list tanggal
        std::vector<std::string> list_tanggal;
        std::map<std::string, std::vector<std::string>> map_tanggal;
        mysql_query(conn, "SELECT DISTINCT tanggal_masuk FROM `pasien` ORDER BY tanggal_masuk DESC");
        MYSQL_RES *result = mysql_store_result(conn);
        MYSQL_ROW row;
        int fields_count = mysql_num_fields(result);
        while ((row = mysql_fetch_row(result))) {
            list_tanggal.push_back(row[0]);
        }
        // lakukan perulangan untuk setiap tanggal
        for (std::string tanggal : list_tanggal) {
            std::string query = "SELECT * FROM `pasien` WHERE tanggal_masuk = '" + tanggal + "'";
            mysql_query(conn, query.c_str());
            MYSQL_RES *result = mysql_store_result(conn);
            MYSQL_ROW row;
            int fields_count = mysql_num_fields(result);
            while ((row = mysql_fetch_row(result))) {
                for (int i = 0; i < fields_count; i++) {
                    map_tanggal[tanggal].push_back(row[i]);
                }
            }
        }
        // lakukan query untuk setiap tanggal

        for (auto &[key, value] : map_tanggal) {
            std::cout << "============================================================" << std::endl;
            for (std::string data : value) {
                std::cout << data << std::endl;
            }
        }
        // tampilkan hasil query
    }
    return 0;
}