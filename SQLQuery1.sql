SELECT * 
FROM [Covid-19 Project]..Project1
order by 3,4

--Select * 
--From [Covid-19 Project]..Project2
--order by 3,4

-- Select data that we are going to be using

SELECT Location, date, total_cases, new_cases, total_deaths, population
FROM [Covid-19 Project]..Project1
order by 1,2

-- Looking at Total Cases vs Total Deaths
-- Shows likelihood of dying if you contrarct covid in your country
SELECT Location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentege
FROM [Covid-19 Project]..Project1
WHERE location like '%Croatia%'
order by 1,2

-- Looking at Total Cases vs Population
-- Shows what percentage of Population got Covid
SELECT Location, date, population, total_cases, (total_cases/population)*100 as PopulationInfectionPercentage
FROM [Covid-19 Project]..Project1
WHERE location like '%Croatia%'
order by 1,2

-- Countries with Highest Infection Rate compared to Population
SELECT Location, population, MAX(total_cases) as HighestInfectionCount, MAX((total_cases/population))*100 as PopulationInfectionPercentage
FROM [Covid-19 Project]..Project1
--WHERE location like '%Croatia%'
group by Location, population
order by PopulationInfectionPercentage desc
 
 -- Countries with Highest Death Count per Population
SELECT location,  MAX(cast(Total_deaths  as int)) as TotalDeathCount
FROM [Covid-19 Project]..Project1
--WHERE location like '%Croatia%'
group by location
order by TotalDeathCount desc

-- CONITNENT NUMBERS

-- Continents with Highest Death Count per population
SELECT continent,  MAX(cast(Total_deaths  as int)) as TotalDeathCount
FROM [Covid-19 Project]..Project1
--WHERE location like '%Croatia%'
group by continent
order by TotalDeathCount desc
