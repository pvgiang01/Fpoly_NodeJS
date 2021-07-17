import React, { useState } from 'react'
import { Text, View, StyleSheet, Button, Pressable, FlatList } from 'react-native';

const posts = [
    {postId: 1, title: 'Dịch COVID-19 diễn biến phức tạp, thêm lộ trình cho xe lưu thông ở khu vực phía Nam'},
    {postId: 2, title: 'Tổng cục Đường bộ Việt Nam vừa có văn bản về bổ sung phương án tổ chức giao thông cho xe lưu thông quá cảnh qua các tỉnh'},
    {postId: 3, title: 'Phân luồng tổ chức giao thông cho các phương tiện từ tỉnh Ninh Thuận đi về các tỉnh vùng Đông Nam Bộ và TP.HCM'},
    {postId: 4, title: 'Lộ trình 1: Quốc lộ 1 → Quốc lộ 55 → Quốc lộ 51 → tỉnh Bà Rịa - VũngTàu. '},
    {postId: 5, title: 'Lộ trình 2: Quốc lộ 1 → Quốc lộ 56 → Quốc lộ 51 → tỉnh Bà Rịa - Vũng Tàu.'},
    {postId: 6, title: 'Lộ trình 3: Quốc lộ 1 → cao tốc TP.HCM - Long Thành - Dầu Giây → Quốc lộ 51 → tỉnh Bà Rịa - Vũng Tàu.'},
    {postId: 7, title: 'Lộ trình 1: Quốc lộ 1 → tuyến tránh TP Biên Hòa, Quốc lộ 1→ Quốc lộ 51 → Quốc lộ 1 (cầu Đồng Nai) → TP.HCM. '},
]

export const FlatListScreen = props => {
    const renderItem = value => {
        const {item} = value
        return (
            <View style={styles.viewContainer}>
                <Text style={styles.textPostTitle}>{item.title}</Text>
            </View>
        )
    }
    return (
        <>
            <View style={styles.container}>
                <View style={styles.title}>
                    <Text style={styles.titleText}>Màn hình FlatList</Text>
                </View>
                <FlatList 
                    data={posts}
                    renderItem={renderItem}
                    keyExtractor={item => item.postId}
                />
            </View>

        </>
    )
}

const styles = StyleSheet.create({
    textPostTitle:{
        fontSize: 25
    },
    viewContainer:{
        backgroundColor: '#E5E5E5',
        marginBottom: 20,
        padding: 12
    },
    titleText: {
        fontSize: 30,
        color: 'white'
    },
    title: {
        margin: 50,
        alignItems: 'center'
    },
    container: {
        backgroundColor: '#4D005E',
        padding: 8,
        flex: 1
    }
})