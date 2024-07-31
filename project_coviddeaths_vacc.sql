select*
from covidvacc;

describe coviddeaths;

select*
from coviddeaths
where continent is not null
order by 3,4;

select*
from covidvacc
where continent is not null
order by 3,4;

select location, date,total_cases,new_cases, total_deaths, population
from coviddeaths
where continent is not null
order by 1,2;

---location vs total_deaths in united state;
select location, date,total_cases, total_deaths,((total_deaths/total_cases)*100) as death_per_cases
from coviddeaths
where location like "%states%" and continent is not null
order by 1,2;

---totat cases vs population in united states;
select location, date,total_cases, population,((total_cases/population)*100) as Cases_per_population
from coviddeaths
where location like "%states%" and continent is not null
order by 1,2;

---country with highest infection to population;
select location,max(total_cases) as HighestInfectionCountry, population,max(((total_cases/population)*100)) as HighestCases_per_population
from coviddeaths
where continent is not null
group by location,population
order by 4 desc ;

---country with death count to population;
select location,max(cast(total_deaths as int)) as TotalDeathCount
from coviddeaths
where continent is not null
group by location
order by 2 desc ;

select date, SUM(new_deaths ) as TotalDeath, SUM(new_cases) as totalCases, round((sum(new_deaths)/sum(new_cases))*100,2) as globalDeath_cases
from coviddeaths
WHERE continent IS NOT NULL
GROUP BY DATE
ORDER BY 1,2 desc;
---analysing vaccination;
select*
from  covidvacc;


select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
from coviddeaths dea
join covidvacc vac
	on dea.location=vac.location
	and dea.date=vac.date
where dea.continent is not null
order by 1,2,3

---temp table;
create table percentagePopVac(
continent nvarchar(255),
location nvarchar(255),
date datetime,
poppulation numeric,
new_vaccinations numeric,
rollingPeopleVaccinated numeric
)

create view for date visuals;

create view VaccPopulationPerc as
select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
from coviddeaths dea
join covidvacc vac
	on dea.location=vac.location
	and dea.date=vac.date
where dea.continent is not null;vaccpopulationpercvaccpopulationperc
order by 1,2,3







