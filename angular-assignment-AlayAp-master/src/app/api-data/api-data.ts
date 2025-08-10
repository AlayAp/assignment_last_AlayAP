import { Component, OnInit, signal } from '@angular/core';
import { CommonModule } from '@angular/common';
import { Api, Post, User } from '../services/api';

@Component({
  selector: 'app-api-data',
  imports: [CommonModule],
  templateUrl: './api-data.html',
  styleUrl: './api-data.css'
})
export class ApiData implements OnInit {
  posts = signal<Post[]>([]);
  users = signal<User[]>([]);
  loading = signal(false);
  error = signal<string | null>(null);
  activeTab = signal<'posts' | 'users'>('posts');

  constructor(private apiService: Api) {}

  ngOnInit() {
    this.loadData();
  }

  loadData() {
    this.loading.set(true);
    this.error.set(null);
    
    if (this.activeTab() === 'posts') {
      this.apiService.getPosts().subscribe({
        next: (data) => {
          this.posts.set(data.slice(0, 20)); // Limit to first 20 posts
          this.loading.set(false);
        },
        error: (err) => {
          this.error.set('Failed to load posts. Please try again later.');
          this.loading.set(false);
        }
      });
    } else {
      this.apiService.getUsers().subscribe({
        next: (data) => {
          this.users.set(data);
          this.loading.set(false);
        },
        error: (err) => {
          this.error.set('Failed to load users. Please try again later.');
          this.loading.set(false);
        }
      });
    }
  }

  switchTab(tab: 'posts' | 'users') {
    this.activeTab.set(tab);
    this.loadData();
  }

  retry() {
    this.loadData();
  }
}
