/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import entity.Account;
import entity.Cart;
import entity.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Hi Ryo
 */
public class DAOCART {
    
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    public int checkCart(int uid, int pid) {
        String query = "SELECT Amount FROM Cart WHERE AccountID = ? AND ProductID = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, uid);
            ps.setInt(2, pid);
            rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public void deleteCart(int uid, int pid) {
        String query = "DELETE FROM Cart WHERE AccountID = ? AND ProductID = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, uid);
            ps.setInt(2, pid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void setCart(int uid, int pid, int amount) {
        if (amount == 0) {
            deleteCart(uid, pid);
            return;
        }
        String query = "UPDATE [Cart] SET Amount = ? WHERE AccountID = ? AND ProductID = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, amount);
            ps.setInt(2, uid);
            ps.setInt(3, pid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void removeAllCart(int uid) {
        ArrayList<Account> arr = new ArrayList();
        //ArrayList<Account> arr = new ArrayList<>();

        String query = "DELETE FROM Cart WHERE AccountID = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, uid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void toggle(String uid, boolean check) {
        String query = "UPDATE Account SET isSell = " + (check ? 0 : 1) + " WHERE uID = " + uid;
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void addToCart(int uid, int pid, int amount) {
        String query = "";
        int a = checkCart(uid, pid);
        if (a == 0) {
            query = "INSERT INTO [Cart]\n"
                    + "           ([AccountID]\n"
                    + "           ,[ProductID]\n"
                    + "           ,[Amount])\n"
                    + "     VALUES\n"
                    + "           (?,?,?)";
        } else {
            query = "UPDATE [Cart] SET Amount = Amount + ? WHERE AccountID = ? AND ProductID = ?";
        }
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            if (a == 0) {
                ps.setInt(1, uid);
                ps.setInt(2, pid);
                ps.setInt(3, amount);
            } else {
                ps.setInt(2, uid);
                ps.setInt(3, pid);
                ps.setInt(1, amount);
            }
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    public ArrayList<Cart> getCart(int id) {
        ArrayList<Cart> arr = new ArrayList();
        String query = "select * from Cart\n"
                + "where [AccountID] = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                int amount = rs.getInt("Amount");
                DAOPRODUCT daoproduct = new DAOPRODUCT();
                Product p = daoproduct.getProductByID(String.valueOf(rs.getInt("ProductID")));
                arr.add(new Cart(p.getId(), amount, p.getImage(), p.getPrice(), p.getName()));
            }
        } catch (Exception e) {
        }
        return arr;
    }    
    public int getCartAmount(int id) {
        String query = "select count(ProductID) as amount from Cart\n"
                + "where [AccountID] = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("amount");
            }
        } catch (Exception e) {
        }
        return 0;
    }
}
