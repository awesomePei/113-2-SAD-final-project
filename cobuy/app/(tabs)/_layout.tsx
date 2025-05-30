import { View, Text, TouchableOpacity } from 'react-native';
import React from 'react';
import { Tabs } from 'expo-router';
import { Ionicons, Feather } from '@expo/vector-icons';

import useOrderWebSocket from '../hooks/useOrderWebSocket';
import { useAuth } from '../../contexts/auth-context';

const _Layout = () => {
  const { username } = useAuth();  // 抓使用者 ID
  if (username) {
  useOrderWebSocket(username);  // 建立 WebSocket 連線
}

  return (
    <Tabs
      screenOptions={{
        tabBarShowLabel: false,
        tabBarStyle: {
          position: 'absolute',
          bottom: 0,
          left: 16,
          right: 16,
          height: 56,
          backgroundColor: '#FFF8F0',
          borderRadius: 0,
          elevation: 5,
        },
      }}
    >
      <Tabs.Screen
        name='index'
        options={{
          headerShown: false,
          tabBarIcon: ({ focused }) => (
            <Ionicons
              name="home-outline"
              size={24}
              color={focused ? '#B38F7D' : '#AAA'}
            />
          ),
        }}
      />
      <Tabs.Screen
        name='notification'
        options={{
          tabBarIcon: ({ focused }) => (
            <Ionicons
              name="notifications-outline"
              size={24}
              color={focused ? '#B38F7D' : '#AAA'}
            />
          ),
          title: '通知中心'
        }}
      />
      <Tabs.Screen
        name='create_order'
        options={{
          tabBarIcon: () => <Feather name="plus" size={24} color="#FFF" />,
          tabBarButton: props => (
            <TouchableOpacity
              {...props}
              style={{
                ...props.style,
                top: -20,
                backgroundColor: '#B38F7D',
                width: 64,
                height: 64,
                borderRadius: 32,
                justifyContent: 'center',
                alignItems: 'center',
              }}
            />
          ),
          title: '發起團購'
        }}
      />
      <Tabs.Screen
        name='history_order'
        options={{
          tabBarIcon: ({ focused }) => (
            <Ionicons
              name="document-text-outline"
              size={24}
              color={focused ? '#B38F7D' : '#AAA'}
            />
          ),
          title: '我的團購'
        }}
      />
      <Tabs.Screen
        name='profile'
        options={{
          tabBarIcon: ({ focused }) => (
            <Ionicons
              name="person-outline"
              size={24}
              color={focused ? '#B38F7D' : '#AAA'}
            />
          ),
          title: username || '個人資訊',
        }}
      />
    </Tabs>
  );
}

export default _Layout;
