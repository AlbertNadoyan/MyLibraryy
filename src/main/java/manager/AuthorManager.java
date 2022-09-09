package manager;

import db.DBConnectionProvider;
import model.Author;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AuthorManager {
    private Connection connection = DBConnectionProvider.getInstance().getConnection();

    public void addAuthor(Author author){
        String sql = "insert into author (name, surname, email, age, author_pic) values (?, ?, ?, ?, ?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, author.getName());
            ps.setString(2, author.getSurname());
            ps.setString(3, author.getEmail());
            ps.setInt(4, author.getAge());
            ps.setString(5, author.getAuthorPic());

            ps.executeUpdate();

            ResultSet resultSet = ps.getGeneratedKeys();
            if(resultSet.next()){
                int id = resultSet.getInt(1);
                author.setId(id);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    public List<Author> getAllAuthor(){
        String sql = "select * from author";
        List<Author> authors = new ArrayList<>();
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()){
                authors.add(getAuthorFromResultSet(resultSet));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return authors;

    }

    private Author getAuthorFromResultSet(ResultSet resultSet) throws SQLException {
        return Author.builder()
                .id(resultSet.getInt(1))
                .name(resultSet.getString(2))
                .surname(resultSet.getString(3))
                .email(resultSet.getString(4))
                .age(resultSet.getInt(5))
                .authorPic(resultSet.getString(6))
                .build();
    }

    public Author getById(int id){
        String sql = "select * from author where id = " + id;
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);
            if(resultSet.next()){
                return getAuthorFromResultSet(resultSet);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;

    }

    public Author getAuthorName(String authorN){
        String sql = "select * from author where name = " + authorN;
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);
            if (resultSet.next()){
                return getAuthorFromResultSet(resultSet);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public void edit(Author author){
        String sql = "update author set name = ?, surname = ?, email = ?, age = ? where id = ?";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            preparedStatement.setString(1, author.getName());
            preparedStatement.setString(2, author.getSurname());
            preparedStatement.setString(3, author.getEmail());
            preparedStatement.setInt(4, author.getAge());
            preparedStatement.setInt(5, author.getId());
//            preparedStatement.setString(5, author.getAuthorPic());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void deleteAuthor(int id){
        String sql = "delete from author where id = " + id;
        try {
            Statement statement = connection.createStatement();
            statement.executeUpdate(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

}
