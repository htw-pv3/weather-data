#
# Figure
#

plt.rc('font', family='Helvetica', size=14)
# To later reset to default font settings: plt.rcdefaults()

fig = plt.figure(figsize=(12, 6))
ax = plt.subplot()

plt.plot(
    x_values, ldc,
    lw=1.5,
    label='Load duration curve'
)

plt.plot(
    x_values, coal,
    lw=1.5,
    label='Coal generation'
)

legend = plt.legend()
legend.draw_frame(False)

plt.xlim(0, 8760)
plt.ylim(0, 1)

ax.spines['right'].set_visible(False)
ax.spines['top'].set_visible(False)

ax.spines['bottom'].set_color('grey')
ax.spines['left'].set_color('grey')

ax.yaxis.grid(True, which='major', color='#CDCDCD', linestyle='-')

plt.savefig('01_ex01.png', dpi=300, bbox_inches='tight', pad_inches=0.5)
