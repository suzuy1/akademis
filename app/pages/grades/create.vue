<template>
  <div>
    <h1>Add New Grade</h1>
    <form @submit.prevent="addGrade">
      <select v-model="grade.student_id">
        <option v-for="student in students" :key="student.id" :value="student.id">
          {{ student.name }}
        </option>
      </select>
      <select v-model="grade.course_id">
        <option v-for="course in courses" :key="course.id" :value="course.id">
          {{ course.nama }}
        </option>
      </select>
      <input v-model="grade.grade" placeholder="Grade" />
      <button type="submit">Add Grade</button>
    </form>
  </div>
</template>

<script setup>
import { useRouter } from 'vue-router';

const supabase = useSupabaseClient()
const router = useRouter()
const grade = ref({
  student_id: null,
  course_id: null,
  grade: ''
})
const students = ref([])
const courses = ref([])

const getStudents = async () => {
  const { data, error } = await supabase.from('students').select('*')
  if (error) {
    console.error(error)
  } else {
    students.value = data
  }
}

const getCourses = async () => {
  const { data, error } = await supabase.from('courses').select('*')
  if (error) {
    console.error(error)
  } else {
    courses.value = data
  }
}

const addGrade = async () => {
  const { data, error } = await supabase.from('grades').insert([grade.value])
  if (error) {
    console.error(error)
  } else {
    router.push('/grades')
  }
}

getStudents()
getCourses()
</script>
