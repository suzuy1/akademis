<template>
  <div>
    <h1>Students</h1>
    <NuxtLink to="/students/create">Add Student</NuxtLink>
    <table>
      <thead>
        <tr>
          <th>NIM</th>
          <th>Name</th>
          <th>Jurusan</th>
          <th>Tahun</th>
          <th>Alamat</th>
          <th>Actions</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="student in students" :key="student.id">
          <td>{{ student.nim }}</td>
          <td>{{ student.name }}</td>
          <td>{{ student.jurusan }}</td>
          <td>{{ student.tahun }}</td>
          <td>{{ student.alamat }}</td>
          <td>
            <NuxtLink :to="`/students/edit/${student.id}`">Edit</NuxtLink>
            <button @click="deleteStudent(student.id)">Delete</button>
          </td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script setup>
const supabase = useSupabaseClient()
const students = ref([])

const getStudents = async () => {
  const { data, error } = await supabase.from('students').select('*')
  if (error) {
    console.error(error)
  } else {
    students.value = data
  }
}

const deleteStudent = async (id) => {
  const { error } = await supabase.from('students').delete().eq('id', id)
  if (error) {
    console.error(error)
  } else {
    // Refresh the list of students
    getStudents()
  }
}

getStudents()
</script>
