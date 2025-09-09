<template>
  <div class="container">
    <nav>
      <ul>
        <li><NuxtLink to="/students">Students</NuxtLink></li>
        <li><NuxtLink to="/lecturers">Lecturers</NuxtLink></li>
        <li><NuxtLink to="/courses">Courses</NuxtLink></li>
        <li><NuxtLink to="/grades">Grades</NuxtLink></li>
      </ul>
    </nav>
    <main>
      <slot />
    </main>
  </div>
</template>

<style>
body {
  font-family: sans-serif;
  margin: 0;
  padding: 0;
}

.container {
  max-width: 1200px;
  margin: 0 auto;
  padding: 20px;
}

nav {
  background-color: #f0f0f0;
  padding: 10px;
  margin-bottom: 20px;
}

nav ul {
  list-style: none;
  margin: 0;
  padding: 0;
  display: flex;
}

nav li {
  margin-right: 20px;
}

nav a {
  text-decoration: none;
  color: #333;
  font-weight: bold;
}

nav a:hover {
  color: #007bff;
}
</style>
