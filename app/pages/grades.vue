<template>
  <div>
    <h1>Grades</h1>
    <NuxtLink to="/grades/create">Add Grade</NuxtLink>
    <table>
      <thead>
        <tr>
          <th>Student</th>
          <th>Course</th>
          <th>Grade</th>
          <th>Actions</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="grade in grades" :key="grade.id">
          <td>{{ grade.students.name }}</td>
          <td>{{ grade.courses.nama }}</td>
          <td>{{ grade.grade }}</td>
          <td>
            <NuxtLink :to="`/grades/edit/${grade.id}`">Edit</NuxtLink>
            <button @click="deleteGrade(grade.id)">Delete</button>
          </td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script setup>
const supabase = useSupabaseClient()
const grades = ref([])

const getGrades = async () => {
  const { data, error } = await supabase
    .from('grades')
    .select('id, grade, students (name), courses (nama)')
    
  if (error) {
    console.error('Error fetching grades:', error)
  } else {
    grades.value = data
  }
}

const deleteGrade = async (id) => {
  const { error } = await supabase.from('grades').delete().eq('id', id)
  if (error) {
    console.error('Error deleting grade:', error)
  } else {
    getGrades()
  }
}

getGrades()
</script>
