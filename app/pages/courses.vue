<template>
  <div>
    <h1>Courses</h1>
    <NuxtLink to="/courses/create">Add Course</NuxtLink>
    <table>
      <thead>
        <tr>
          <th>Kode</th>
          <th>Nama</th>
          <th>SKS</th>
          <th>Actions</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="course in courses" :key="course.id">
          <td>{{ course.kode }}</td>
          <td>{{ course.nama }}</td>
          <td>{{ course.sks }}</td>
          <td>
            <NuxtLink :to="`/courses/edit/${course.id}`">Edit</NuxtLink>
            <button @click="deleteCourse(course.id)">Delete</button>
          </td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script setup>
const supabase = useSupabaseClient()
const courses = ref([])

const getCourses = async () => {
  const { data, error } = await supabase.from('courses').select('*')
  if (error) {
    console.error(error)
  } else {
    courses.value = data
  }
}

const deleteCourse = async (id) => {
  const { error } = await supabase.from('courses').delete().eq('id', id)
  if (error) {
    console.error(error)
  } else {
    // Refresh the list of courses
    getCourses()
  }
}

getCourses()
</script>
