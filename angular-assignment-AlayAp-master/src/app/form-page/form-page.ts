import { Component, signal } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ReactiveFormsModule, FormBuilder, FormGroup, Validators } from '@angular/forms';

interface FeedbackForm {
  name: string;
  email: string;
  subject: string;
  message: string;
  rating: number;
}

@Component({
  selector: 'app-form-page',
  imports: [CommonModule, ReactiveFormsModule],
  templateUrl: './form-page.html',
  styleUrl: './form-page.css'
})
export class FormPage {
  feedbackForm: FormGroup;
  submitted = signal(false);
  submissionStatus = signal<'idle' | 'submitting' | 'success' | 'error'>('idle');
  submissionMessage = signal('');

  constructor(private fb: FormBuilder) {
    this.feedbackForm = this.fb.group({
      name: ['', [Validators.required, Validators.minLength(2)]],
      email: ['', [Validators.required, Validators.email]],
      subject: ['', [Validators.required, Validators.minLength(5)]],
      message: ['', [Validators.required, Validators.minLength(10)]],
      rating: [5, [Validators.required, Validators.min(1), Validators.max(5)]]
    });
  }

  get f() {
    return this.feedbackForm.controls;
  }

  onSubmit() {
    this.submitted.set(true);

    if (this.feedbackForm.invalid) {
      return;
    }

    this.submissionStatus.set('submitting');
    
    // Simulate API call
    setTimeout(() => {
      const formData: FeedbackForm = this.feedbackForm.value;
      console.log('Form Submitted:', formData);
      
      // Simulate success (you could implement actual API call here)
      this.submissionStatus.set('success');
      this.submissionMessage.set('Thank you for your feedback! We have received your message and will respond soon.');
      
      // Reset form after successful submission
      this.feedbackForm.reset({
        name: '',
        email: '',
        subject: '',
        message: '',
        rating: 5
      });
      this.submitted.set(false);
      
      // Reset success message after 5 seconds
      setTimeout(() => {
        this.submissionStatus.set('idle');
        this.submissionMessage.set('');
      }, 5000);
      
    }, 2000); // Simulate 2 second delay
  }

  getFieldError(fieldName: string): string {
    const field = this.feedbackForm.get(fieldName);
    if (field?.errors && (field.dirty || field.touched || this.submitted())) {
      if (field.errors['required']) {
        return `${fieldName.charAt(0).toUpperCase() + fieldName.slice(1)} is required.`;
      }
      if (field.errors['email']) {
        return 'Please enter a valid email address.';
      }
      if (field.errors['minlength']) {
        return `${fieldName.charAt(0).toUpperCase() + fieldName.slice(1)} must be at least ${field.errors['minlength'].requiredLength} characters long.`;
      }
      if (field.errors['min'] || field.errors['max']) {
        return 'Rating must be between 1 and 5.';
      }
    }
    return '';
  }

  isFieldInvalid(fieldName: string): boolean {
    const field = this.feedbackForm.get(fieldName);
    return !!(field?.invalid && (field.dirty || field.touched || this.submitted()));
  }
}
