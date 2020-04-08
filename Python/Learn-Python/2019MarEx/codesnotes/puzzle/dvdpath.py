import os

# check if path is exist function
def isPathExist(path):
    return os.path.exists(path)

def searchForVolumesThatContains(list, word):
    disk_volumes = []
    for i in list:
        if word in i:
            disk_volumes.append(i)
        else:
            continue

    return disk_volumes

# define volume name
volume_to_search = '/dev'

# find current volumes path
if isPathExist(volume_to_search) is True:
    print 'There is a directory for volumes called "%s"' % volume_to_search

    # ask user for which volume search is looking for
    look_for_disk = raw_input("Are you looking for 'disk' volumes? y / n \n > ")

    # search for current volumes
    list_of_volumes = os.listdir(volume_to_search)

    # print volumes based on user answer (y/n)
    if look_for_disk is 'y':
        print searchForVolumesThatContains(list_of_volumes, 'disk')
    elif look_for_disk is 'n':
        print list_of_volumes
    else:
        print "Try again! ..."

else:
    print 'Sorry, there is no directory for for "%s"' % volume_to_search
